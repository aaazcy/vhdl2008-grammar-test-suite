-- =============================================================
-- Case ID: TC_CONCURRENT_SIMPLE_SIGNAL_ASSIGNMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SIMPLE_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_simple_signal_assignment ::= target <= [ guarded ] [ delay_mechanism ] waveform ;
-- Case Type: Positive
-- Test Focus: Minimal form——`y <= a;` with no guarded and no delay, verifying the smallest legal form of a simple concurrent signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity css_min_ent is
  port(a : in bit; y : out bit);
end entity css_min_ent;
architecture bh of css_min_ent is
begin
  y <= a;
end architecture bh;
