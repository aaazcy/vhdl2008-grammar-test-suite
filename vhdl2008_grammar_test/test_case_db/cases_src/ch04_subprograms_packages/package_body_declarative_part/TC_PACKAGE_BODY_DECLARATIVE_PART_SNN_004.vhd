-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_PART_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_part ::= { package_body_declarative_item }
-- Case Type: Negative
-- Test Focus: package_body_declarative_part: type declared after use — items in the declarative part are processed top-to-bottom; function f_apply references type mask_t in its parameter list before mask_t is declared, so the name cannot be resolved
-- Expected Result: Triggers semantic error: no declaration for "mask_t"
-- Dependencies: None
-- =============================================================
package pbdp_ubd_pkg is
end package pbdp_ubd_pkg;
package body pbdp_ubd_pkg is
  constant C_DEFAULT : bit_vector(7 downto 0) := X"FF";
  function f_apply(v : mask_t) return mask_t is
  begin
    return v;
  end function;
  type mask_t is array(7 downto 0) of bit;
end package body pbdp_ubd_pkg;
