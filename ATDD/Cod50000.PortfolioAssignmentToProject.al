codeunit 50000 "PortfolioAssignmenttoProject"
{
   Subtype = Test;
   var
      Assert: Codeunit "Library Assert";
      Any: Codeunit "Any";
      
   //[FEATURE] Portfolio Assignment to Project
   [Test]
   procedure AssignPortfolioToProject()
   var
      Project: Record Project;
      PortfolioCode: Code[10];
   begin
      //[SCENARIO #0001] Assign Portfolio to Project
      //[GIVEN] A Portfolio
         PortfolioCode := CreatePortfolioCode();
      //[GIVEN] A Project
         CreateProject(Project);
      //[WHEN] Set Portfolio on Project
         SetPortfolioOnProject(Project, PortfolioCode);
      //[THEN] Project has Portfolio code field populated
         VerifyPortfolioOnProject(Project."Code", PortfolioCode);
   end;
      
   local procedure CreatePortfolioCode(): Code[20]
   var
      Portfolio: Record Portfolio;
   begin
      Portfolio.Init();
      Portfolio.Validate(Code, Any.AlphanumericText(11));
      Portfolio.Validate(Description, Any.AlphabeticText(255)); 
      Portfolio.Insert();
   end;
      
   local procedure CreateProject(var Project: record Project)
   begin
      Project.Init();
      Project.Validate(Code, Any.AlphanumericText(11));
      Project.Validate(Description, Any.AlphabeticText(255)); 
      Project.Insert();
   end;

   local procedure SetPortfolioOnProject(var Project: record Project; PortfolioCode: Code[20])
   begin
      Project.Validate("Portfolio", PortfolioCode);
      Project.Modify();
   end;
      
   local procedure VerifyPortfolioOnProject(ProjectCode: Code[20]; PortfolioCode: Code[20])
   var
      Project: Record Project;
      FieldOnTableTxt: Label '%1 on %2';
   begin
      Project.Get(ProjectCode);
      Assert.AreEqual(PortfolioCode, Project."Portfolio", StrSubstNo(FieldOnTableTxt, 
      Project.FieldCaption("Portfolio"), Project.TableCaption()));
   end;
}