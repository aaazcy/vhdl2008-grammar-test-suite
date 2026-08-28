-- =============================================================
-- Case ID: TC_ELEMENT_RESOLUTION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_resolution ::= array_element_resolution
--              | record_resolution
-- Case Type: Positive
-- Test Focus: element_resolution choosing array_element_resolution.
--            A shared bus with resolved bit elements. Each bus line
--            independently resolves multiple drivers via a wired-AND
--            resolution function.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity shared_bus_resolved is
  port (
    dev_a : in  bit_vector(3 downto 0);
    dev_b : in  bit_vector(3 downto 0);
    bus_v : out bit_vector(3 downto 0)
  );
end entity shared_bus_resolved;

architecture rtl of shared_bus_resolved is
  function resolve_and (vs : bit_vector) return bit is
    variable r : bit := '1';
  begin
    for i in vs'range loop
      if vs(i) = '0' then r := '0'; end if;
    end loop;
    return r;
  end function;
  -- element_resolution via array_element_resolution
  subtype rbit is resolve_and bit;
  type rbus is array (3 downto 0) of rbit;
  signal shared_bus : rbus;
begin
  shared_bus <= rbus(dev_a);
  shared_bus <= rbus(dev_b);
  bus_v <= bit_vector(shared_bus);
end architecture rtl;
