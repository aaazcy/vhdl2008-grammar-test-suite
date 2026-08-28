-- =============================================================
-- Case ID: TC_SIMPLE_WAVEFORM_ASSIGNMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_waveform_assignment ::= target <= [ delay_mechanism ] waveform ;
-- Case Type: Positive
-- Test Focus: Indexed slice target with inertial delay, exercising both slice name as target and delay_mechanism in the same assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity swa_idxdel_ent is port(data:in bit_vector(15 downto 0); y:out bit_vector(3 downto 0)); end entity;
architecture assign of swa_idxdel_ent is
  signal s_buf : bit_vector(15 downto 0);
begin
  s_buf(3 downto 0) <= data(7 downto 4) after 3 ns;
  y <= s_buf(3 downto 0);
end architecture assign;
