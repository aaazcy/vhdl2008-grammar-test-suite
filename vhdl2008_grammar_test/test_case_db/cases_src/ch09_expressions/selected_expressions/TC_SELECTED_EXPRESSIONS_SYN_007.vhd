-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Test Focus: Used in concurrent selected signal assignment: with opcode select ... directly uses selected_expressions in the concurrent region of the architecture body
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_se_concur is
  port (
    opcode : in  bit_vector(1 downto 0);
    a, b   : in  integer;
    y      : out integer
  );
end entity ent_se_concur;

architecture concurrent_sel of ent_se_concur is
begin
  with opcode select
    y <= a         when "00",
         b         when "01",
         a + b     when "10",
         a - b     when "11";
end architecture concurrent_sel;
