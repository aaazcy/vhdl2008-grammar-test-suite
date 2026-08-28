-- =============================================================
-- Case ID: TC_GROUP_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_declaration ::= group identifier : group_template_name ( group_constituent_list ) ;
-- Case Type: Positive
-- Test Focus: group_declaration: full group declaration with signals as constituents referencing a template
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity gd_signal_constituents_syn is
  port (
    out_a : out bit;
    out_b : out bit
  );
end entity gd_signal_constituents_syn;

architecture focused of gd_signal_constituents_syn is
  group pin_pair is (signal, signal <>);
  signal s_req : bit := '0';
  signal s_gnt : bit := '1';
  group arbiter_pins : pin_pair (s_req, s_gnt);
begin
  s_req <= not s_req after 10 ns;
  s_gnt <= s_req after 3 ns;
  out_a <= s_req;
  out_b <= s_gnt;
end architecture focused;
