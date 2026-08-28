-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_declaration ::= subtype identifier is subtype_indication ;
-- Case Type: Positive
-- Test Focus: subtype declaration with resolution function
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sd_syn_resolved is port(dout:out bit); end entity;
architecture rtl of sd_syn_resolved is
  function or_bit(v:bit_vector) return bit is
    variable r:bit:='0'; begin for i in v'range loop if v(i)='1' then r:='1'; end if; end loop; return r; end function;
  subtype rbit is or_bit bit;
  signal s:rbit:='0';
begin s<='1'; dout<=s; end architecture;