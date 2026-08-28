-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_RESOLUTION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_resolution ::= resolution_indication
-- Case Type: Positive
-- Test Focus: Resolution function for bit elements in an array.
--            A wired-AND resolution function resolves multiple
--            drivers on a shared bus line array. Each element
--            gets resolved independently via the resolution_indication.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wired_and_bus_array is
  port (
    driver_a : in  bit_vector(3 downto 0);
    driver_b : in  bit_vector(3 downto 0);
    bus_out  : out bit_vector(3 downto 0)
  );
end entity wired_and_bus_array;

architecture rtl of wired_and_bus_array is
  function resolve_wired_and (values : bit_vector) return bit is
    variable result : bit := '1';
  begin
    for i in values'range loop
      if values(i) = '0' then result := '0'; end if;
    end loop;
    return result;
  end function;
  -- array_element_resolution: resolution_indication applied to element
  subtype resolved_bit is resolve_wired_and bit;
  type resolved_bus is array (3 downto 0) of resolved_bit;
  signal shared_line : resolved_bus;
begin
  shared_line <= resolved_bus(driver_a);
  shared_line <= resolved_bus(driver_b);
  bus_out <= bit_vector(shared_line);
end architecture rtl;
