-- =============================================================
-- Case ID: TC_DELAY_MECHANISM_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_DELAY_MECHANISM
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: delay_mechanism ::= transport | [ reject time_expression ] inertial
-- Case Type: Positive
-- Test Focus: Three forms of delay mechanism: transport (pure transport delay) / inertial default (inertial delay) / reject+inertial (explicit pulse rejection), verifying the syntax of the transport/inertial/reject keywords of delay_mechanism in waveform assignments
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dm_ent is port(a:in integer; y1,y2,y3:out integer); end entity;
architecture bh of dm_ent is
  signal s_t,s_i,s_r:integer:=0;
begin
  process(a) begin
    s_t<=transport a after 5 ns;
    s_i<=a after 3 ns;
    s_r<=reject 2 ns inertial a after 10 ns;
  end process;
  y1<=s_t; y2<=s_i; y3<=s_r;
end architecture bh;
