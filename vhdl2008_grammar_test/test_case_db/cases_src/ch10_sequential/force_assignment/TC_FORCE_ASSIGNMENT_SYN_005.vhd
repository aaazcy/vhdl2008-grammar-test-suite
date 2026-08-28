-- =============================================================
-- Case ID: TC_FORCE_ASSIGNMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: force_assignment ::= target <= force [ force_mode ] conditional_expressions ;
-- Case Type: Positive
-- Test Focus: Force with out mode combined with conditional when/else -- tests `force out expr when cond else expr` on an output port
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity force_asgn_syn_005 is
  port (
    o_data : out bit_vector(3 downto 0)
  );
end entity force_asgn_syn_005;

architecture test of force_asgn_syn_005 is
  signal s_mode : bit := '0';
begin
  process is
  begin
    o_data <= force out "1111" when s_mode = '1' else "0000";
    wait for 10 ns;
    o_data <= release out;
    wait;
  end process;
end architecture test;
