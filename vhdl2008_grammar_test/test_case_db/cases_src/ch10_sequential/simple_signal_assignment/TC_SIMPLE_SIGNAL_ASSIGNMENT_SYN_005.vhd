-- =============================================================
-- Case ID: TC_SIMPLE_SIGNAL_ASSIGNMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_signal_assignment ::= simple_waveform_assignment | simple_force_assignment | simple_release_assignment
-- Case Type: Positive
-- Test Focus: Indexed target simple signal assignment: target s_arr(idx) is an array index, assigned the expression a+b, verifying the indexed_name of simple_signal_assignment as target
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sisa_syn5_ent is port(a,b:in integer; idx:in integer range 0 to 7; y:out integer); end entity;
architecture bh of sisa_syn5_ent is
  type t_arr is array(0 to 7) of integer;
  signal s_arr:t_arr:=(others=>0);
begin
  process(a,b,idx) begin
    s_arr(idx) <= a + b;
    y <= s_arr(idx);
  end process;
end architecture bh;
