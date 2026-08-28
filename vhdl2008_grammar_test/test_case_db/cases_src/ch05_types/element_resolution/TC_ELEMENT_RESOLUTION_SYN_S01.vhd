-- =============================================================
-- Case ID: TC_ELEMENT_RESOLUTION_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_resolution ::= array_element_resolution
--              | record_resolution
-- Case Type: Positive (Production-Specific)
-- Test Focus: Production-specific direct test of element_resolution
--            using both alternatives. A bus arbiter uses
--            array_element_resolution for data lines and
--            record_resolution for control signals.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bus_arbiter_resolved is
  port (
    m0_data : in  bit_vector(7 downto 0);
    m1_data : in  bit_vector(7 downto 0);
    m0_req  : in  bit;
    m1_req  : in  bit;
    bus_out : out bit_vector(7 downto 0);
    grant   : out bit
  );
end entity bus_arbiter_resolved;

architecture rtl of bus_arbiter_resolved is
  function bus_resolve (vs : bit_vector) return bit is
    variable r : bit := '0';
  begin
    for i in vs'range loop r := r or vs(i); end loop;
    return r;
  end function;
  subtype rbit is bus_resolve bit;
  -- element_resolution: array_element_resolution for data bus
  type data_bus is array (7 downto 0) of rbit;
  signal d_bus : data_bus;
  -- element_resolution: record_resolution for control
  type ctrl_reg is record
    gnt : rbit;
  end record;
  signal ctrl : ctrl_reg;
begin
  d_bus <= data_bus(m0_data);
  d_bus <= data_bus(m1_data);
  bus_out <= bit_vector(d_bus);
  ctrl.gnt <= m0_req;
  ctrl.gnt <= m1_req;
  grant <= ctrl.gnt;
end architecture rtl;
