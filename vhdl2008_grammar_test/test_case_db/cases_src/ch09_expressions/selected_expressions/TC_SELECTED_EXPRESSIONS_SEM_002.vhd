-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_SELECTED_EXPRESSIONS_EXHAUSTIVE
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Rule Description: All possible values of the selector expression type must be covered by the choices (either explicitly or via 'others').
-- Test Focus: Explicitly enumerate all choices: all three values of enumeration type (IDLE,RUN,STOP) are listed explicitly in the when branches, covering all cases without others
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity se_sem_exhaustive is
  port (
    state : in  integer range 0 to 2;
    y     : out bit
  );
end entity se_sem_exhaustive;

architecture exhaustive_se of se_sem_exhaustive is
begin
  with state select
    y <= '0' when 0,
         '1' when 1,
         '0' when 2;  -- All three possible values (0,1,2) explicitly covered
end architecture exhaustive_se;
