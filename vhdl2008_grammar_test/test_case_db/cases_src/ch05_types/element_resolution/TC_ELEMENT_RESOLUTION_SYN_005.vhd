-- =============================================================
-- Case ID: TC_ELEMENT_RESOLUTION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_resolution ::= array_element_resolution
--              | record_resolution
-- Case Type: Positive
-- Test Focus: element_resolution with record_resolution where
--            a record field itself is an array of resolved elements.
--            An interrupt controller with per-source resolved
--            pending flags.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interrupt_controller_resolved is
  port (
    irq_a : in  bit;
    irq_b : in  bit;
    irq_c : in  bit;
    irq   : out bit
  );
end entity interrupt_controller_resolved;

architecture rtl of interrupt_controller_resolved is
  function irq_resolve (vs : bit_vector) return bit is
    variable r : bit := '0';
  begin
    for i in vs'range loop r := r or vs(i); end loop;
    return r;
  end function;
  subtype irq_bit is irq_resolve bit;
  type irq_reg is record
    pending : irq_bit;
  end record;
  signal reg : irq_reg;
begin
  reg.pending <= irq_a;
  reg.pending <= irq_b;
  reg.pending <= irq_c;
  irq <= reg.pending;
end architecture rtl;
