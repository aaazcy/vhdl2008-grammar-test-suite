-- =============================================================
-- Case ID: TC_AGGREGATE_SYN_S03
-- Rule Type: Syntax
-- Related Rule ID: BNF_AGGREGATE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: aggregate ::= ( element_association { , element_association } )
-- Case Type: Positive
-- Test Focus: Named aggregate for a record type: the aggregate (x=>10, y=>20, z=>30) of record t_pt(x,y,z:integer) — all three element_associations use field names as choices, verifying the named element associations of a record aggregate
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity agg_record_named is
  port (
    total : out integer
  );
end entity agg_record_named;

architecture point3d of agg_record_named is
  type t_point is record x, y, z : integer; end record;
  signal s : t_point;
begin
  s <= (x => 10, y => 20, z => 30);
  total <= s.x + s.y + s.z;
end architecture point3d;
