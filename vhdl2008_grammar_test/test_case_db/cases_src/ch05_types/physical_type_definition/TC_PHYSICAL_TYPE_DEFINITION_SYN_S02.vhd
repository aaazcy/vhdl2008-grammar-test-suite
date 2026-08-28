-- =============================================================
-- Case ID: TC_PHYSICAL_TYPE_DEFINITION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_PHYSICAL_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_type_definition ::= range_constraint units primary_unit_declaration { secondary_unit_declaration } end units
-- Case Type: Positive
-- Test Focus: memory-size physical type (power-of-2 units)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity phys_spc2_ent is port(r:out integer); end entity;
architecture bh of phys_spc2_ent is
  type t_memory is range 0 to 1024*1024*1024
    units
      B;
      KB = 1024 B;
      MB = 1024 KB;
      GB = 1024 MB;
    end units t_memory;
  signal s_m : t_memory := 512 MB;
begin
  s_m <= 2 GB after 1 ns;
  r <= t_memory'pos(s_m) / t_memory'pos(1 KB);
end architecture bh;
