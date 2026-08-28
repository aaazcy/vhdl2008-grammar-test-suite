-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_RESOLUTION_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_ARRAY_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_resolution ::= resolution_indication
-- Case Type: Positive
-- Test Focus: Semantic: array of resolved elements used in a
--            multi-master I2C SDA/SCL line model. Each element
--            resolves independently as an open-drain line.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity i2c_bus_line_model is
  port (
    sda_out   : out bit;
    scl_out   : out bit;
    sda_m0    : in  bit;
    sda_m1    : in  bit;
    scl_m0    : in  bit;
    scl_m1    : in  bit
  );
end entity i2c_bus_line_model;

architecture rtl of i2c_bus_line_model is
  function open_drain_resolve (vals : bit_vector) return bit is
    variable result : bit := '1';
  begin
    for i in vals'range loop
      if vals(i) = '0' then result := '0'; end if;
    end loop;
    return result;
  end function;
  subtype od_bit is open_drain_resolve bit;
  type i2c_pair is array (0 to 1) of od_bit;
  signal bus_lines : i2c_pair;
begin
  bus_lines(0) <= sda_m0;  bus_lines(0) <= sda_m1;
  bus_lines(1) <= scl_m0;  bus_lines(1) <= scl_m1;
  sda_out <= bus_lines(0);
  scl_out <= bus_lines(1);
end architecture rtl;
