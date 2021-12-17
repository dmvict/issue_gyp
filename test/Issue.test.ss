( function _Issue_test_s_()
{

'use strict';

require( 'wTesting' );
const _ = _global_.wTools;
const __ = _globals_.testing.wTools;

// --
// tests
// --

function trivial( test )
{
  const a = test.assetFor( false );
  a.fileProvider.dirMake( a.abs( '.' ) );

  /* - */

  a.ready.then( () =>
  {
    test.case = 'should add all submodules';
    return null;
  });
  /* latest is the version where deasync was built for njs v16 */
  a.shell( 'npm add wdeasync@stable w.process.tree.windows@stable bufferfromfile@stable ' );
  a.ready.then( ( op ) =>
  {
    test.identical( op.exitCode, 0 );
  });

  /* - */

  return a.ready;
}

// --
// declare
// --

const Proto =
{
  name : 'Issue',
  silencing : 1,
  routineTimeOut : 300000,
  tests :
  {
    trivial,
  },
};

//

const Self = wTestSuite( Proto );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self.name );

})();

