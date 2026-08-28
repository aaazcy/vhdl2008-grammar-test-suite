-- =============================================================
-- Case ID: TC_RECORD_RESOLUTION_SEM_001
-- Related Rule ID: SEM_RECORD_R_001
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_resolution ::= record_element_resolution { , record_element_resolution }
-- Test Focus: Duplicate element name in record_resolution. Each
--   record_element_simple_name must be unique within a single
--   record_resolution.
-- Expected Result: Compilation error: duplicate element resolution
-- Dependencies: None
-- =============================================================
entity record_resolution_duplicate_element is
end entity record_resolution_duplicate_element;

architecture dup_elem of record_resolution_duplicate_element is
  function r_or(d : bit_vector) return bit is
  begin for i in d'range loop if d(i)='1' then return '1'; end if; end loop;
    return '0';
  end function;
  type t_rec is record
    val : bit;
  end record;
  -- ERROR: "val" appears twice in the resolution list
  subtype t_sub is t_rec(val r_or, val r_or);
  signal s : t_sub;
begin
end architecture dup_elem;
