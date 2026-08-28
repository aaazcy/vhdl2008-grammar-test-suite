-- =============================================================
-- Case ID: TC_INTERFACE_ELEMENT_SNN_004
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_INTERFACE_ELEMENT
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_element ::= interface_declaration
-- Case Type: Negative
-- Test Focus: SNN: interface_signal_declaration missing the subtype_indication after mode - in 'signal dout : in' the mode keyword in has no type mark after it, verifying interface_declaration requires a subtype_indication after the mode
-- Expected Result: Triggers syntax error: type mark expected in a subtype indication
-- Dependencies: None
-- =============================================================
entity iface_ent is
  port (
    signal dout : in
  );
end entity iface_ent;
architecture err of iface_ent is
begin
end architecture err;
