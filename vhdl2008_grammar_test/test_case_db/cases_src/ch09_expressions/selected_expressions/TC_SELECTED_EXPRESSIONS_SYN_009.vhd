-- =============================================================
-- Case ID: TC_SELECTED_EXPRESSIONS_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: selected_expressions ::= { expression when choices , } expression when choices
-- Case Type: Positive
-- Test Focus: selected expression in variable assignment inside a process: within the process, with sel select v := ... performs a selected assignment to a variable, verifying selected expression usage in a variable assignment context
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity se_var_assign is
  port (
    sel    : in  integer range 0 to 3;
    a, b   : in  bit_vector(7 downto 0);
    result : out bit_vector(7 downto 0)
  );
end entity se_var_assign;

architecture var_se of se_var_assign is
begin
  process(sel, a, b)
    variable v : bit_vector(7 downto 0);
  begin
    with sel select
      v := a          when 0,
           b          when 1,
           a and b    when 2,
           a or b     when others;
    result <= v;
  end process;
end architecture var_se;
