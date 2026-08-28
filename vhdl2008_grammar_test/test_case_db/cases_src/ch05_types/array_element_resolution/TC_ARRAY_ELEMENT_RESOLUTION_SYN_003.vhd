-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_RESOLUTION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_resolution ::= resolution_indication
-- Case Type: Positive
-- Test Focus: array_element_resolution with record-type elements.
--            Each record element in the array uses a resolution
--            function for its bit field. Models a multi-source
--            status register array.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity multi_source_status_array is
  port (
    src1_flags : in  bit_vector(3 downto 0);
    src2_flags : in  bit_vector(3 downto 0);
    combined   : out bit_vector(3 downto 0)
  );
end entity multi_source_status_array;

architecture rtl of multi_source_status_array is
  function resolve_or (values : bit_vector) return bit is
    variable result : bit := '0';
  begin
    for i in values'range loop
      if values(i) = '1' then result := '1'; end if;
    end loop;
    return result;
  end function;
  subtype resolved_bit is resolve_or bit;
  type status_reg is record
    flag : resolved_bit;
  end record;
  type status_array is array (0 to 3) of status_reg;
  signal flags : status_array;
begin
  gen_flags : for i in 0 to 3 generate
    flags(i).flag <= src1_flags(i);
    flags(i).flag <= src2_flags(i);
    combined(i) <= flags(i).flag;
  end generate;
end architecture rtl;
