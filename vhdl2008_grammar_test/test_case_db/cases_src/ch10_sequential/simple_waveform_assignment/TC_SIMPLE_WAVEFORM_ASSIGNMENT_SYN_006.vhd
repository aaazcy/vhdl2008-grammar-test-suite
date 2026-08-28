-- =============================================================
-- Case ID: TC_SIMPLE_WAVEFORM_ASSIGNMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIMPLE_WAVEFORM_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: simple_waveform_assignment ::= target <= [ delay_mechanism ] waveform ;
-- Case Type: Positive
-- Test Focus: Aggregate target in waveform assignment — named association aggregate on LHS receives record-typed waveform expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity swa_aggtarg_ent is port(x_in,y_in:in integer; x_out,y_out:out integer); end entity;
architecture assign of swa_aggtarg_ent is
  type point_2d is record
    px : integer;
    py : integer;
  end record;
  signal s_origin : point_2d;
begin
  s_origin <= (px => x_in, py => y_in);
  (x_out, y_out) <= s_origin after 1 ns;
end architecture assign;
