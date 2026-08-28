-- =============================================================
-- Case ID: TC_SELECTED_FORCE_ASSIGNMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_FORCE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: selected_force_assignment ::= with expression select [ ? ] target <= force [ force_mode ] selected_expressions ;
-- Case Type: Positive
-- Test Focus: Selected force with bit_vector select expression -- tests composite bit_vector as the driving select expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_force_syn_006 is
end entity sel_force_syn_006;

architecture test of sel_force_syn_006 is
  signal s_select : bit_vector(1 downto 0) := "00";
  signal s_target : integer := 0;
begin
  process is
  begin
    with s_select select s_target <= force
      5  when "00",
      10 when "01",
      15 when "10",
      20 when "11";
    wait for 10 ns;
    s_target <= release;
    wait;
  end process;
end architecture test;
