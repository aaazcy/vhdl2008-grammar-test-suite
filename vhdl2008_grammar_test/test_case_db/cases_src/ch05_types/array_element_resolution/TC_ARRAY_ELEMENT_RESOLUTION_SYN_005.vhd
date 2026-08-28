-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_RESOLUTION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_resolution ::= resolution_indication
-- Case Type: Positive
-- Test Focus: array_element_resolution with a resolution function
--            taking an unconstrained array parameter. Each element
--            in the array is resolved using the same function.
--            Models an interrupt vector collector.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interrupt_vector_collector is
  port (
    int_src0  : in  integer;
    int_src1  : in  integer;
    priority  : out integer
  );
end entity interrupt_vector_collector;

architecture rtl of interrupt_vector_collector is
  function max_priority (values : integer_vector) return integer is
    variable result : integer := 0;
  begin
    for i in values'range loop
      if values(i) > result then result := values(i); end if;
    end loop;
    return result;
  end function;
  -- array_element_resolution: resolution_indication on element type
  subtype resolved_priority is max_priority integer;
  type irq_array is array (0 to 1) of resolved_priority;
  signal irqs : irq_array;
begin
  irqs(0) <= int_src0;
  irqs(0) <= int_src1;
  priority <= irqs(0);
end architecture rtl;
