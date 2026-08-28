-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.3
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record
-- Case Type: Positive
-- Test Focus: nested records (record containing records)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rec_spc2_ent is port(r:out integer); end entity;
architecture bh of rec_spc2_ent is
  type t_point is record x, y, z : integer; end record;
  type t_triangle is record
    p1, p2, p3 : t_point;
    area       : real;
  end record;
  signal s_tri : t_triangle := (p1=>(0,0,0), p2=>(3,0,0), p3=>(0,4,0), area=>6.0);
begin
  process
  begin
    s_tri.p1.x <= 1;
    s_tri.p1.y <= 2;
    s_tri.area <= 12.0;
    r <= s_tri.p1.x + s_tri.p1.y; wait;
  end process;
end architecture bh;
