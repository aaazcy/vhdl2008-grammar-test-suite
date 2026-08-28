-- =============================================================
-- Case ID: TC_TYPE_DECLARATION_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_TYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: type_declaration ::= full_type_declaration | incomplete_type_declaration
-- Case Type: Negative
-- Test Focus: static model negative — physical type secondary unit 'mm = 0.5 m;' uses a non-integer physical literal multiplier, but secondary units may only be defined by an integer multiple of a primary or secondary unit
-- Expected Result: Triggers semantic error: secondary units may only be defined by an integer
-- Dependencies: None
-- =============================================================
entity td47b_ent is port(dout:out integer); end entity;
architecture rtl of td47b_ent is
  type t_bad is range 0 to 1000 units
    m;
    mm = 0.5 m;
  end units;
begin
  dout<=0;
end architecture;
