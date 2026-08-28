-- =============================================================
-- Case ID: TC_ELEMENT_RESOLUTION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_ELEMENT_RESOLUTION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_resolution ::= array_element_resolution
--              | record_resolution
-- Case Type: Positive
-- Test Focus: Semantic: array_element_resolution for a CAN bus
--            controller's TX lines. Multiple TX buffers drive
--            the same resolved line using a dominant-recessive
--            resolution function.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity can_tx_line_arbiter is
  port (
    tx_buf0 : in  bit;
    tx_buf1 : in  bit;
    tx_buf2 : in  bit;
    can_tx  : out bit
  );
end entity can_tx_line_arbiter;

architecture rtl of can_tx_line_arbiter is
  function can_resolve (vs : bit_vector) return bit is
    variable r : bit := '1';
  begin
    -- dominant = '0', recessive = '1'. If any drives dominant, result is dominant.
    for i in vs'range loop
      if vs(i) = '0' then r := '0'; end if;
    end loop;
    return r;
  end function;
  subtype can_bit is can_resolve bit;
  type can_tx_array is array (0 to 0) of can_bit;
  signal tx_line : can_tx_array;
begin
  tx_line(0) <= tx_buf0;
  tx_line(0) <= tx_buf1;
  tx_line(0) <= tx_buf2;
  can_tx <= tx_line(0);
end architecture rtl;
