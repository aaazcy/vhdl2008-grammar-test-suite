-- =============================================================
-- Case ID: TC_RECORD_ELEMENT_RESOLUTION_SEM_002
-- Related Rule ID: SEM_RECORD_E_002
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_element_resolution ::= record_element_simple_name resolution_indication
-- Case Type: Positive
-- Test Focus: SEMANTIC -- record element resolution applies a
--            resolution function to a specific field within a
--            record type. The resolution function resolves multiple
--            drivers on the record element.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rec_elem_res_sem_resolved is
  port (
    dout : out bit
  );
end entity rec_elem_res_sem_resolved;
architecture rtl of rec_elem_res_sem_resolved is
  function resolve_bit(v : bit_vector) return bit is
    variable r : bit := '0';
  begin
    for i in v'range loop if v(i) = '1' then r := '1'; end if; end loop;
    return r;
  end function;
  subtype rbit is resolve_bit bit;
  type t_bus is record
    valid : rbit;
    value : integer;
  end record;
  signal s_bus : t_bus := (valid => '0', value => 0);
begin
  s_bus.valid <= '1';
  s_bus.value <= 42;
  dout <= s_bus.valid;
end architecture rtl;
