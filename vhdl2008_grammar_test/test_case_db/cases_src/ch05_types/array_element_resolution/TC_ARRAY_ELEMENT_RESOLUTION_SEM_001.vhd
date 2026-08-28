-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_RESOLUTION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_ARRAY_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_resolution ::= resolution_indication
-- Case Type: Positive
-- Test Focus: Semantic correctness: a tristate bus controller
--            with resolved array elements. Multiple bus masters
--            drive the same resolved lines. The resolution
--            function correctly handles the Z-state (represented
--            as driving vs. not driving in bit resolution).
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tristate_bus_controller is
  port (
    master_a_req : in  bit;
    master_a_dat : in  bit_vector(7 downto 0);
    master_b_req : in  bit;
    master_b_dat : in  bit_vector(7 downto 0);
    bus_data     : out bit_vector(7 downto 0)
  );
end entity tristate_bus_controller;

architecture rtl of tristate_bus_controller is
  function bus_resolve (vals : bit_vector) return bit is
    variable result : bit := '0';
  begin
    for i in vals'range loop
      result := result or vals(i);
    end loop;
    return result;
  end function;
  subtype bus_bit is bus_resolve bit;
  type bus_array is array (7 downto 0) of bus_bit;
  signal shared_bus : bus_array;
begin
  -- master A drives when it requests
  shared_bus <= master_a_dat when master_a_req = '1' else (others => '0');
  -- master B drives when it requests
  shared_bus <= master_b_dat when master_b_req = '1' else (others => '0');
  bus_data <= shared_bus;
end architecture rtl;
