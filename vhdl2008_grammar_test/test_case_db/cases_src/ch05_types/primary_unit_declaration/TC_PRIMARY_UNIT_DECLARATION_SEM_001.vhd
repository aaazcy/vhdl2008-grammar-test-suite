-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_DECLARATION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_PRIMARY_UNIT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: primary_unit_declaration ::= identifier ;
-- Case Type: Positive
-- Test Focus: SEMANTIC -- primary unit compared against derived secondary unit
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pud_sem_compare is port(dout:out integer); end entity;
architecture rtl of pud_sem_compare is
  type t_dist is range 0 to 1000000 units
    m; km=1000 m;
  end units;
  signal s:t_dist:=1 km; signal r:integer:=0;
begin
  process begin
    if s>=1000 m then r<=1; end if;
    dout<=r; wait;
  end process;
end architecture rtl;
