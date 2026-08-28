-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Positive
-- Test Focus: Record with boolean, character, and natural fields using end record without optional identifier, validating the minimal closing form of the production
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rec_mix_ent is port(r:out boolean); end entity;
architecture rec_mix_arch of rec_mix_ent is
  type t_config is record
    enabled  : boolean;
    mode     : character;
    timeout  : natural;
  end record;
  signal s_cfg : t_config := (enabled => true, mode => 'A', timeout => 100);
begin
  r <= s_cfg.enabled;
end architecture rec_mix_arch;
