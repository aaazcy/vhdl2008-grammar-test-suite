-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONDITIONAL_EXPRESSIONS_SAME_TYPE
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Positive
-- Rule Description: All expression branches in a conditional expression must have the same type.
-- Test Focus: SEM: all branch expressions have the same type — the three when branches and the final else all return integer, verifying that compilation succeeds only with consistent types
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_ce_sem_001 is
  port (
    score : in  integer;
    grade : out integer
  );
end entity ent_ce_sem_001;

architecture same_type of ent_ce_sem_001 is
begin
  grade <= 4 when score >= 90 else
           3 when score >= 75 else
           2 when score >= 60 else
           1;
end architecture same_type;
