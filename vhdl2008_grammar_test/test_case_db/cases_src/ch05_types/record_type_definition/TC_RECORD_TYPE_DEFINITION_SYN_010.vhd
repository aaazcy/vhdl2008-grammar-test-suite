-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Positive
-- Test Focus: Multiple distinct record type definitions in the same declarative region, each with different field compositions, verifying that the production is reusable within the same scope
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rec_multi_ent is port(r:out integer); end entity;
architecture rec_multi_arch of rec_multi_ent is
  type t_coord is record
    x : integer range -1024 to 1023;
    y : integer range -1024 to 1023;
  end record t_coord;

  type t_color is record
    r_val : integer range 0 to 15;
    g_val : integer range 0 to 15;
    b_val : integer range 0 to 15;
  end record t_color;

  signal s_pixel_pos : t_coord := (x => 0, y => 0);
  signal s_pixel_col : t_color := (r_val => 7, g_val => 0, b_val => 7);
begin
  s_pixel_pos.x <= s_pixel_pos.x + 1;
  r <= s_pixel_col.r_val;
end architecture rec_multi_arch;
