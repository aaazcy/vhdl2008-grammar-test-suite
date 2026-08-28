-- =============================================================
-- Case ID: TC_LIBRARY_UNIT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_LIBRARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: library_unit ::= primary_unit | secondary_unit
-- Case Type: Positive
-- Test Focus: complete library_unit combination — entity+architecture+package+package body as four independent library_units: entity(primary), architecture(secondary), package(primary), package body(secondary) — verifies all main alternative forms of primary_unit and secondary_unit can each combine as independent library_units
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

-- library_unit 1: primary_unit (entity)
entity lu_full_ent is
  port (
    a : in  bit_vector(3 downto 0);
    b : in  bit_vector(3 downto 0);
    y : out bit_vector(3 downto 0)
  );
end entity lu_full_ent;

-- library_unit 2: secondary_unit (architecture)
architecture rtl of lu_full_ent is
begin
  y <= a xor b;
end architecture rtl;

-- library_unit 3: primary_unit (package)
package lu_full_pkg is
  constant C_POLY : bit_vector(7 downto 0) := "10001101";
  function f_parity(v : bit_vector) return bit;
end package lu_full_pkg;

-- library_unit 4: secondary_unit (package body)
package body lu_full_pkg is
  function f_parity(v : bit_vector) return bit is
    variable result : bit := '0';
  begin
    for i in v'range loop
      result := result xor v(i);
    end loop;
    return result;
  end function f_parity;
end package body lu_full_pkg;
