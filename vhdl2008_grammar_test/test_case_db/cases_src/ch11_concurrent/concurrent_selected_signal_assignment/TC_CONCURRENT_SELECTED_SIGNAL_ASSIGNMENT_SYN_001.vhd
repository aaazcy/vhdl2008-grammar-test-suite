-- =============================================================
-- Case ID: TC_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_SELECTED_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 11.6
-- Production: concurrent_selected_signal_assignment ::= with expression select [ ? ] target <= [ guarded ] [ delay_mechanism ] selected_waveforms ;
-- Case Type: Positive
-- Test Focus: minimal form: 2-to-1 select — `with sel select y <= a when '0', b when '1';` has no guarded/delay modifiers, verifying the minimal complete form of a selected signal assignment
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity cssa_min_ent is
  port(a, b, sel : in bit; y : out bit);
end entity cssa_min_ent;
architecture bh of cssa_min_ent is
begin
  with sel select
    y <= a when '0',
         b when '1';
end architecture bh;
