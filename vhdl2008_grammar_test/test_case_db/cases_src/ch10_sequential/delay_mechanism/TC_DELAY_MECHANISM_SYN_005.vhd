-- =============================================================
-- Case ID: TC_DELAY_MECHANISM_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_DELAY_MECHANISM
-- Standard Reference: IEEE 1076-2008 Section 10.5.2.1
-- Production: delay_mechanism ::= transport | [ reject time_expression ] inertial
-- Case Type: Positive
-- Test Focus: delay_mechanism: all three forms together (transport, inertial default, reject+inertial) in one architecture
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity delay_mech_syn5_ent is port(input_sig:in integer; y1,y2,y3:out integer); end entity;
architecture bh of delay_mech_syn5_ent is
  signal s_t,s_i,s_r:integer:=0;
begin
  process(input_sig) is
  begin
    s_t <= transport input_sig after 1 ns;
    s_i <= input_sig after 5 ns;
    s_r <= reject 1 ns inertial input_sig after 5 ns;
  end process;
  y1 <= s_t;
  y2 <= s_i;
  y3 <= s_r;
end architecture bh;
