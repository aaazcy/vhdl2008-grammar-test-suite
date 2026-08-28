-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Test Focus: others used in choices — when others covers all case values not explicitly listed
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_se_others is
  port (
    sel : in  integer range 0 to 5;
    y   : out bit_vector(1 downto 0)
  );
end entity ent_se_others;

architecture others_choice of ent_se_others is
begin
  with sel select
    y <= "00" when 0,
         "01" when 1,
         "10" when 2,
         "11" when others;
end architecture others_choice;
