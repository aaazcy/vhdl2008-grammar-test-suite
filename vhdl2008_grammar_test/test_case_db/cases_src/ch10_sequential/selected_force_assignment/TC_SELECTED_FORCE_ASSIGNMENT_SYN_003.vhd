-- =============================================================
-- Case ID: TC_SELECTED_FORCE_ASSIGNMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_force_assignment ::= with expression select [ ? ] target <= force [ force_mode ] selected_expressions ;
-- Case Type: Positive
-- Test Focus: Selected force with out mode and multiple non-others choices on an output port signal -- tests force out in selected form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_force_syn_003 is
  port (
    o_data : out std_logic_vector(1 downto 0)
  );
end entity sel_force_syn_003;

architecture test of sel_force_syn_003 is
  signal s_sel : integer range 0 to 2 := 0;
begin
  process is
  begin
    with s_sel select o_data <= force out
      "00" when 0,
      "01" when 1,
      "10" when 2;
    wait for 10 ns;
    o_data <= release out;
    wait;
  end process;
end architecture test;
