-- =============================================================
-- Case ID: TC_DISCONNECTION_SPECIFICATION_SNN_004
-- Rule Type: Syntax (Negative)
-- BNF Production: DISCONNECTION_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.3.3
-- Production: disconnection_specification ::= disconnect guarded_signal_specification after time_expression ;
-- Case Type: Negative
-- Test Focus: Missing semicolon terminator — the disconnect specification must end with ";" but it is omitted, causing a syntax error in the production terminator
-- Expected Result: Triggers syntax error (missing semicolon)
-- Dependencies: None
-- =============================================================
entity dcspec_no_semi is
  port(a : in bit; y : out bit);
end entity;

architecture bh of dcspec_no_semi is
  signal s_g : bit register;
  -- ERROR: missing ";" at end of disconnect specification
  disconnect s_g : bit after 5 ns
begin
  b_guard : block (a = '1')
  begin
    s_g <= guarded a; y <= s_g;
  end block;
end architecture bh;
