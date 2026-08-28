-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_SNN_002
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_PRIMARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: (Physical type) primary_unit ::= the base measurement unit name — it is the bare identifier before `;` in primary_unit_declaration
-- Case Type: Negative
-- Test Focus: Primary unit name with value assignment — primary_unit_declaration is `identifier ;` but this uses `identifier = literal` which is the secondary_unit_declaration form; primary unit cannot have an equals clause
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity prim_unit_e2 is
  port(clk : in bit; val : out integer);
end entity;
architecture bh of prim_unit_e2 is
  type t_bad is range 0 to 1000 units
    -- ERROR: primary unit cannot have = assignment; that form is for secondary units
    m = 1;
    cm = 100 m;
  end units;
  signal s : t_bad;
begin
  val <= 0;
end architecture bh;
