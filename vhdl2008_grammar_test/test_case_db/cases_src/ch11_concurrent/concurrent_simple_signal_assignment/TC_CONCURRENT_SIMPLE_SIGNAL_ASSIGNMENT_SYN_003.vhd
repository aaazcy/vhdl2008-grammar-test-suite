-- =============================================================
-- Case ID: TC_CONCURRENT_SIMPLE_SIGNAL_ASSIGNMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SIMPLE_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_simple_signal_assignment ::= target <= [ guarded ] [ delay_mechanism ] waveform ;
-- Case Type: Positive
-- Test Focus: With transport delay——`y <= transport a after 3 ns;` uses the transport delay model, verifying the optional delay_mechanism syntax slot
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity css_transport_ent is
  port(a : in bit; y : out bit);
end entity css_transport_ent;
architecture bh of css_transport_ent is
begin
  y <= transport a after 3 ns;
end architecture bh;
