-- =============================================================
-- Case ID: TC_PHYSICAL_TYPE_DEFINITION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_PHYSICAL_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.4
-- Production: physical_type_definition ::= range_constraint units primary_unit_declaration { secondary_unit_declaration } end units [ physical_type_simple_name ]
-- Case Type: Positive
-- Test Focus: Physical type with multi-level secondary units: t_resistance(Ohm/kOhm=1000 Ohm/MOhm=1000 kOhm)+t_capacity(F/mF=0.001 F/uF=0.001 mF), verifying the multi-level derived unit chain of primary_unit_declaration and secondary_unit_declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity phys_ent is port(y:out integer); end entity;
architecture bh of phys_ent is
  type t_res is range 0 to 1000000000 units Ohm; kOhm=1000 Ohm; MOhm=1000 kOhm; end units;
  type t_cap is range 0 to 1000000000 units fF; pF=1000 fF; nF=1000 pF; uF=1000 nF; end units;
  signal s_r:t_res:=10 kOhm;
  signal s_c:t_cap:=100 pF;
begin
  process(s_r)
  begin
    if s_r>1 MOhm then y<=1; else y<=0; end if;
  end process;
end architecture bh;
