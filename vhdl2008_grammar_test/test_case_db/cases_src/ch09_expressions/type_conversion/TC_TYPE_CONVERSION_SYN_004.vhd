-- =============================================================
-- Case ID: TC_TYPE_CONVERSION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_TYPE_CONVERSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.5
-- Production: type_conversion ::= type_mark ( expression )
-- Case Type: Positive
-- Test Focus: array type conversion (same element type): unsigned(bv) converts bit_vector to unsigned type (needs numeric_std), verifying conversions between closely related array types
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_tc_array is
  port (
    bv : in  bit_vector(7 downto 0);
    y  : out integer
  );
end entity ent_tc_array;

architecture array_conv of ent_tc_array is
  function f_bv2int(b : bit_vector) return integer is
    variable v : integer := 0;
  begin
    for i in b'range loop
      if b(i) = '1' then v := v + 2**(i - b'low); end if;
    end loop;
    return v;
  end function;
begin
  y <= f_bv2int(bit_vector(bv));
end architecture array_conv;
