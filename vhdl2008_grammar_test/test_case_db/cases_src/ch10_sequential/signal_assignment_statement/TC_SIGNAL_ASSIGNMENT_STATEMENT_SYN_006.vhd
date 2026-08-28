-- =============================================================
-- Case ID: TC_SIGNAL_ASSIGNMENT_STATEMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: signal_assignment_statement ::= [ label : ] target <= [ delay_mechanism ] waveform ;
-- Case Type: Positive
-- Test Focus: Slice name target: target is slice s_vec(7 downto 4) as the destination + waveform is a 4-bit literal, verifying that target accepts a slice_name form assignment destination
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sas_slice_ent is port(a:in bit_vector(3 downto 0); y:out bit_vector(7 downto 0)); end entity;
architecture bh of sas_slice_ent is
  signal s_vec:bit_vector(7 downto 0):=X"00";
begin
  process(a) begin
    s_vec(7 downto 4)<=a;
    s_vec(3 downto 0)<="0000";
    y<=s_vec;
  end process;
end architecture bh;
