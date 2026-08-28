-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_SYN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body ::=
--   protected body
--     protected_type_body_declarative_part
--   end protected body [ protected_type_simple_name ]
-- Test Focus: Body with variable initialization and type
--   declarations in the declarative part, plus multiple
--   impure functions. Demonstrates body-side data members
--   with nontrivial initial values.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_body_with_type_decl is
  port (
    go   : in  bit;
    high : out integer;
    low  : out integer
  );
end entity pt_body_with_type_decl;

architecture rtl of pt_body_with_type_decl is
  type t_bounds is protected
    procedure update(x : integer);
    impure function upper return integer;
    impure function lower return integer;
  end protected;
  type t_bounds is protected body
    type t_pair is record
      lo : integer;
      hi : integer;
    end record;
    variable v_bnd : t_pair := (lo => 100, hi => -100);
    procedure update(x : integer) is
    begin
      if x > v_bnd.hi then v_bnd.hi := x; end if;
      if x < v_bnd.lo then v_bnd.lo := x; end if;
    end procedure;
    impure function upper return integer is
    begin return v_bnd.hi; end function;
    impure function lower return integer is
    begin return v_bnd.lo; end function;
  end protected body;
  shared variable sv_bnd : t_bounds;
begin
  process(go)
  begin
    if go'event and go = '1' then
      sv_bnd.update(50);
      sv_bnd.update(200);
      high <= sv_bnd.upper;
      low  <= sv_bnd.lower;
    end if;
  end process;
end architecture rtl;
