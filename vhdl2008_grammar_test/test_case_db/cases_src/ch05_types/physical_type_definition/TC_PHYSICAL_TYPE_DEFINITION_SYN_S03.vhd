-- =============================================================
-- Case ID: TC_PHYSICAL_TYPE_DEFINITION_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_PHYSICAL_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_type_definition ::= range_constraint units primary_unit_declaration { secondary_unit_declaration } end units
-- Case Type: Positive
-- Test Focus: descending physical range with small units
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity phys_spc3_ent is port(r:out integer); end entity;
architecture bh of phys_spc3_ent is
  type t_dist is range 1000 downto 0
    units
      um;
      mm = 1000 um;
      cm = 10 mm;
    end units t_dist;
  signal s_d : t_dist := 10 cm;
begin
  s_d <= 5 mm after 1 ns;
  r <= t_dist'pos(s_d);
end architecture bh;
