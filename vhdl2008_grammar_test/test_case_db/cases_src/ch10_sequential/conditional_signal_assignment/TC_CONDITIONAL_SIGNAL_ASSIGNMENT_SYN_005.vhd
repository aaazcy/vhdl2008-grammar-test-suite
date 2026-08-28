-- =============================================================
-- Case ID: TC_CONDITIONAL_SIGNAL_ASSIGNMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: conditional_signal_assignment ::= conditional_waveform_assignment | conditional_force_assignment
-- Case Type: Positive
-- Test Focus: Conditional signal assignment applied to a priority encoder: 4-level when-else priority chain, target s_pri outputs the corresponding data value in the priority order sel(0)~sel(3), verifying the multi-level when-else cascade of conditional_signal_assignment in a real priority encoder
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity csa_syn5_ent is port(sel:in bit_vector(3 downto 0); data:in integer; y:out integer); end entity;
architecture bh of csa_syn5_ent is
  signal s_pri:integer:=0;
begin
  process(sel, data) begin
    s_pri <= data*8 when sel(0) = '1' else
             data*4 when sel(1) = '1' else
             data*2 when sel(2) = '1' else
             data   when sel(3) = '1' else
             0;
    y <= s_pri;
  end process;
end architecture bh;
