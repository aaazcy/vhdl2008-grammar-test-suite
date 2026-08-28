-- =============================================================
-- Case ID: TC_SECONDARY_UNIT_DECLARATION_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_SECONDARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: secondary_unit_declaration ::= identifier = physical_literal ;
-- Case Type: Negative
-- Test Focus: static model negative — secondary unit declaration 'MHz = 1 GHz;' uses the physical literal '1 GHz', but no unit named GHz exists in the unit list, so the physical literal cannot be resolved
-- Expected Result: Triggers semantic error: no declaration for "ghz"
-- Dependencies: None
-- =============================================================
entity sud44b_ent is port(dout:out integer); end entity;
architecture rtl of sud44b_ent is
  type t_bad is range 0 to 1000 units
    kHz;
    MHz = 1 GHz;
  end units;
begin
  dout<=0;
end architecture;
