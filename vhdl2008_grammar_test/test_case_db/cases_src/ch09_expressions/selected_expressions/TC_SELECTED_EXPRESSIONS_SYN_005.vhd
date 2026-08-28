-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Test Focus: range used in choices — when 0 to 3 covers a contiguous range of choice values
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_se_range is
  port (
    sel : in  integer range 0 to 7;
    y   : out bit_vector(2 downto 0)
  );
end entity ent_se_range;

architecture range_choice of ent_se_range is
begin
  with sel select
    y <= "000" when 0 to 3,
         "001" when 4 to 6,
         "111" when 7;
end architecture range_choice;
