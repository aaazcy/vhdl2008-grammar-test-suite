-- =============================================================
-- Case ID: TC_ELEMENT_RESOLUTION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_resolution ::= array_element_resolution
--              | record_resolution
-- Case Type: Positive
-- Test Focus: element_resolution choosing record_resolution.
--            A status register with individually resolved bit
--            fields, each field has a resolution function to
--            combine multiple status sources.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity status_register_resolved is
  port (
    src_a_flags : in  bit_vector(1 downto 0);
    src_b_flags : in  bit_vector(1 downto 0);
    combined    : out bit_vector(1 downto 0)
  );
end entity status_register_resolved;

architecture rtl of status_register_resolved is
  function resolve_or (vs : bit_vector) return bit is
    variable r : bit := '0';
  begin
    for i in vs'range loop
      r := r or vs(i);
    end loop;
    return r;
  end function;
  subtype rbit is resolve_or bit;
  -- element_resolution via record_resolution: each field is resolved
  type status_reg is record
    overflow  : rbit;
    underflow : rbit;
  end record;
  signal stat : status_reg;
begin
  stat.overflow  <= src_a_flags(0);
  stat.overflow  <= src_b_flags(0);
  stat.underflow <= src_a_flags(1);
  stat.underflow <= src_b_flags(1);
  combined <= stat.overflow & stat.underflow;
end architecture rtl;
