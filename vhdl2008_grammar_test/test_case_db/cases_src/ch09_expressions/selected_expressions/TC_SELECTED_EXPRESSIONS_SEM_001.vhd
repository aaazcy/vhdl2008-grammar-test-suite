-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SELECTED_EXPRESSIONS_STATIC
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Rule Description: The choices in each selected expression must be locally static expressions of the same discrete type as the selector expression.
-- Test Focus: SEM: choices must be locally static — use constants, enumeration literals, and others as choices, verify that all choices are static
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_se_sem_001 is
  port (
    mode : in  integer range 0 to 2;
    y    : out bit_vector(1 downto 0)
  );
end entity ent_se_sem_001;

architecture static_choices of ent_se_sem_001 is
  constant C_IDLE : integer := 0;
begin
  with mode select
    y <= "00" when C_IDLE,
         "01" when 1,
         "10" when others;
end architecture static_choices;
