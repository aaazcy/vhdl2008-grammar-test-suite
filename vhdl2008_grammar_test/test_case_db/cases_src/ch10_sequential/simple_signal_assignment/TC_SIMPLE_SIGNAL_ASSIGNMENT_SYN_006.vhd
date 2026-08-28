-- =============================================================
-- Case ID: TC_SIMPLE_SIGNAL_ASSIGNMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_signal_assignment ::= simple_waveform_assignment | simple_force_assignment | simple_release_assignment
-- Case Type: Positive
-- Test Focus: Record field target simple signal assignment: target s_rec.data is a record field selected_name + delay_mechanism inertial 1ns, verifying the selected_name target of simple_signal_assignment with a record field
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sisa_syn6_ent is port(din:in integer; wr:in bit; y:out integer); end entity;
architecture bh of sisa_syn6_ent is
  type t_reg is record data:integer; valid:bit; end record;
  signal s_rec:t_reg:=(data=>0,valid=>'0');
begin
  process(din,wr) begin
    s_rec.data <= din after 1 ns;
    s_rec.valid <= wr;
    y <= s_rec.data when s_rec.valid = '1' else 0;
  end process;
end architecture bh;
