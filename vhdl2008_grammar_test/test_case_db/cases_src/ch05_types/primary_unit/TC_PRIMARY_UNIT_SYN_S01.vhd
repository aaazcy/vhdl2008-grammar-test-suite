-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: (Physical type) primary_unit ::= the base measurement unit — the first unit declared with just an identifier in a physical type definition
-- Case Type: Positive (Production-Specific)
-- Test Focus: Production-specific: primary unit used as the reference for ALL arithmetic — addition of same-unit quantities, multiplication by integer, division returning abstract number — all centered on the primary unit as the base reference
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity prim_unit_ref_arithmetic is
  port(
    add_out : out integer;
    mul_out : out integer;
    div_out : out integer
  );
end entity;

architecture base_reference of prim_unit_ref_arithmetic is
  type t_mass is range 0 to 1000000 units
    ug;          -- primary_unit
    mg = 1000 ug;
    g  = 1000 mg;
    kg = 1000 g;
  end units;
  signal m1 : t_mass := 100 ug;
  signal m2 : t_mass := 250 ug;
  signal m_add : t_mass := 0 ug;
  signal m_mul : t_mass := 0 ug;
begin
  m_add <= m1 + m2;              -- addition in primary unit terms
  m_mul <= 5 * m1;               -- scalar * physical = physical
  add_out <= integer(m_add / ug);
  mul_out <= integer(m_mul / ug);
  div_out <= integer(m_add / m1); -- physical / physical = abstract (dimensionless integer)
end architecture;
